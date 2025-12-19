import 'package:flutter/material.dart';
import 'package:sm_reward_app/config/textstyle.dart';

/// Use same size enum as AppTextField
enum AppTextFieldSize { small, medium, large }

class AppDropdownField<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final String? label;
  final String? hintText;
  final String Function(T)? itemLabelBuilder;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  final bool enabled;
  final bool isSearchable;
  final AppTextFieldSize size;
  
  // NEW: Width control properties
  final double? width;
  final double? maxWidth;
  final bool expandToFillParent;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppDropdownField({
    super.key,
    required this.items,
    this.value,
    this.label,
    this.hintText,
    this.itemLabelBuilder,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.isSearchable = false,
    this.size = AppTextFieldSize.medium,
    this.prefixIcon,
    this.suffixIcon,
    // NEW: Width parameters with sensible defaults
    this.width,
    this.maxWidth,
    this.expandToFillParent = false,
  });

  @override
  State<AppDropdownField<T>> createState() => _AppDropdownFieldState<T>();
}

class _AppDropdownFieldState<T> extends State<AppDropdownField<T>> {
  T? _selectedValue;
  final TextEditingController _searchController = TextEditingController();
  List<T> _filteredItems = [];
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
    _filteredItems = widget.items;

    // Initialize search controller with selected value
    if (_selectedValue != null) {
      _searchController.text = _labelFor(_selectedValue as T);
    }
  }

  @override
  void didUpdateWidget(covariant AppDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _selectedValue = widget.value;
      // Update search controller text when value changes externally
      if (_selectedValue != null) {
        _searchController.text = _labelFor(_selectedValue as T);
      } else {
        _searchController.clear();
      }
    }
    if (oldWidget.items != widget.items) {
      _filteredItems = widget.items;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _labelFor(T item) {
    if (widget.itemLabelBuilder != null) {
      return widget.itemLabelBuilder!(item);
    }
    return item.toString();
  }

  double _verticalPadding() {
    switch (widget.size) {
      case AppTextFieldSize.small:
        return 10.0;
      case AppTextFieldSize.medium:
        return 14.0;
      case AppTextFieldSize.large:
        return 18.0;
    }
  }

  /// 🔹 Reduced horizontal padding
  double _horizontalPadding() {
    switch (widget.size) {
      case AppTextFieldSize.small:
        return 8.0;
      case AppTextFieldSize.medium:
        return 10.0;
      case AppTextFieldSize.large:
        return 12.0;
    }
  }

  BorderRadius _borderRadius() {
    switch (widget.size) {
      case AppTextFieldSize.small:
        return BorderRadius.circular(10);
      case AppTextFieldSize.medium:
        return BorderRadius.circular(16);
      case AppTextFieldSize.large:
        return BorderRadius.circular(24);
    }
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items.where((item) {
        final label = _labelFor(item).toLowerCase();
        return label.contains(query.toLowerCase());
      }).toList();
    });
  }

  void _openDropdown() {
    if (!widget.enabled || _isDropdownOpen) return;

    setState(() {
      _isDropdownOpen = true;
      _filteredItems = widget.items;
    });
  }

  void _selectItem(T item) {
    setState(() {
      _selectedValue = item;
      _searchController.text = _labelFor(item);
      _isDropdownOpen = false; // Close dropdown after selection
    });
    widget.onChanged?.call(item);
  }

  InputDecoration _buildDecoration(BuildContext context, String? errorText) {
    final theme = Theme.of(context);
    final decorationTheme = theme.inputDecorationTheme;

    final contentPadding = EdgeInsets.symmetric(
      horizontal: _horizontalPadding(), // 🔹 reduced horizontal padding
      vertical: _verticalPadding(),
    );

    OutlineInputBorder borderFrom(InputBorder? themeBorder) {
      if (themeBorder is OutlineInputBorder) {
        return OutlineInputBorder(
          borderRadius: _borderRadius(),
          borderSide: themeBorder.borderSide,
        );
      }
      return OutlineInputBorder(
        borderRadius: _borderRadius(),
        borderSide: const BorderSide(color: Colors.grey),
      );
    }

    return InputDecoration(
      labelText: widget.label,
      hintText: widget.hintText,
      labelStyle: AppTextStyles.label(context),
      hintStyle: AppTextStyles.bodySmall(context),
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.isSearchable
          ? Icon(
              _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            )
          : (widget.suffixIcon ?? const Icon(Icons.arrow_drop_down_rounded)),
      contentPadding: contentPadding,
      errorText: errorText,
      enabledBorder: borderFrom(decorationTheme.enabledBorder),
      focusedBorder: borderFrom(decorationTheme.focusedBorder),
      errorBorder: borderFrom(decorationTheme.errorBorder),
      focusedErrorBorder: borderFrom(decorationTheme.focusedErrorBorder),
      isDense: true, // Makes the field more compact
      filled: true, // Optional: adds background color
      fillColor: widget.enabled 
          ? (theme.brightness == Brightness.dark 
              ? Colors.grey[900] 
              : Colors.grey[50])
          : Colors.grey[200],
    );
  }

  Widget _buildSearchableDropdown(BuildContext context, FormFieldState<T> field) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Added to prevent unnecessary expansion
      children: [
        // Main searchable field with width constraints
        Container(
          constraints: BoxConstraints(
            maxWidth: widget.maxWidth ?? double.infinity,
          ),
          width: widget.width, // Fixed width if provided
          child: GestureDetector(
            onTap: widget.enabled ? _openDropdown : null,
            child: AbsorbPointer(
              absorbing: !_isDropdownOpen, // Allow typing only when dropdown is open
              child: TextFormField(
                controller: _searchController,
                onChanged: _isDropdownOpen ? _filterItems : null,
                enabled: widget.enabled,
                decoration: _buildDecoration(context, field.errorText),
                style: AppTextStyles.bodyMedium(context),
                validator: (value) {
                  if (widget.validator != null) {
                    return widget.validator!(_selectedValue);
                  }
                  return null;
                },
              ),
            ),
          ),
        ),

        // Dropdown list when open
        if (_isDropdownOpen && widget.enabled)
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: widget.width ?? widget.maxWidth, // Constrain dropdown width too
            constraints: BoxConstraints(
              maxWidth: widget.maxWidth ?? MediaQuery.of(context).size.width * 0.8,
              maxHeight: 200,
            ),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark ? Colors.blueAccent.shade400 : Colors.blue.shade300,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: _filteredItems.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No results found',
                        style: AppTextStyles.bodySmall(context),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      final isSelected = item == _selectedValue;

                      return GestureDetector(
                        onTap: () => _selectItem(item),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal:
                                _horizontalPadding(), // 🔹 reduced horizontal padding for rows
                          ),
                          color: isSelected
                              ? theme.colorScheme.primary.withOpacity(0.1)
                              : Colors.transparent,
                          child: Text(
                            _labelFor(item),
                            style: AppTextStyles.bodyMedium(context).copyWith(
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : (isDark ? Colors.white : Colors.black),
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Width wrapper widget
    Widget buildContent() {
      if (!widget.isSearchable) {
        // ---------- NORMAL DROPDOWN MODE ----------
        return DropdownButtonFormField<T>(
          initialValue: _selectedValue,
          items: widget.items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    _labelFor(item),
                    style: AppTextStyles.bodyMedium(context),
                  ),
                ),
              )
              .toList(),
          onChanged: widget.enabled
              ? (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  widget.onChanged?.call(value);
                }
              : null,
          validator: widget.validator,
          decoration: _buildDecoration(context, null),
          icon: widget.suffixIcon,
          isDense: true,
          isExpanded: widget.expandToFillParent, // Optional: expands to fill available width
        );
      }

      // ---------- SEARCHABLE MODE ----------
      return FormField<T>(
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(value);
          }
          return null;
        },
        initialValue: _selectedValue,
        builder: (field) {
          return _buildSearchableDropdown(context, field);
        },
      );
    }

    // Wrap with width constraints
    return widget.expandToFillParent
        ? Expanded(child: buildContent())
        : (widget.width != null || widget.maxWidth != null)
            ? Container(
                width: widget.width,
                constraints: BoxConstraints(
                  maxWidth: widget.maxWidth ?? double.infinity,
                ),
                child: buildContent(),
              )
            : buildContent();
  }
}