import 'package:get/get.dart';
import '../model/benefit_item_model.dart';

class BenefitsController extends GetxController {

  final benefitsList = <BenefitItemModel>[
    BenefitItemModel(
      title: 'Priority Service Experience',
      description:
          'Faster service appointments, express servicing, and early access to service clinics.',
    ),
    BenefitItemModel(
      title: 'Complimentary Convenience Services',
      description:
          'Free pick-up & drop and quarterly vehicle health checks.',
    ),
    BenefitItemModel(
      title: 'Service Credit Rewards',
      description:
          'Earn credits on paid repairs, general service, car spa, accessories, tyres, batteries, and more.',
    ),
    BenefitItemModel(
      title: 'Exclusive Accessories & Lifestyle Offers',
      description:
          'Special discounts, early access to new collections, and free annual accessory fitment',
    ),
    BenefitItemModel(
      title: 'Tyre & Battery Care Advantage',
      description:
          'Priority replacement service, preferred pricing, and complimentary alignment & balancing',
    ),
    BenefitItemModel(
      title: 'Premium Insurance Support',
      description:
          'Renewal bonuses, Fast-track assistance, courtesy car options, and preferred pricing on aligible policies.',
    ),
    BenefitItemModel(
      title: 'Loyalty & Referral Rewards',
      description:
          'Complimentary polishing on ownership milestones and exclusive rewards for successful referrals.',
    ),
    BenefitItemModel(
      title: 'Lifestyle Experiences',
      description:
          'Invitations to premium events, drive experiences, and a personalized birthday car spa.',
    ),
    BenefitItemModel(
      title: 'Extended Care & Roadside Support',
      description:
          'Complimentary RSA extension, special service plan pricing, and dedicated relationship manager.',
    ),
    BenefitItemModel(
      title: 'Concierge & EV Sustainability Benefits',
      description:
          'Chauffeur services, chauffeur training programs, and complimentary EV charging access at Sundaram Motors locations.',
    ),
  ].obs;
}
