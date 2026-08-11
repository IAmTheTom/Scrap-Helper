part of '../main.dart';

enum Destination { home, yard, either }

enum CargoDemand { tiny, small, medium, largeUpright, fullCargo }

enum ItemStatus {
  lead,
  claimed,
  pickedUp,
  atHome,
  needsStripping,
  processing,
  readyForYard,
  complete,
  ignored,
}

String destinationLabel(Destination value) => switch (value) {
  Destination.home => 'Home',
  Destination.yard => 'Yard',
  Destination.either => 'Either',
};
String cargoLabel(CargoDemand value) => switch (value) {
  CargoDemand.tiny => 'Tiny',
  CargoDemand.small => 'Small',
  CargoDemand.medium => 'Medium',
  CargoDemand.largeUpright => 'Large upright',
  CargoDemand.fullCargo => 'Full cargo',
};
String statusLabel(ItemStatus value) => switch (value) {
  ItemStatus.lead => 'New lead',
  ItemStatus.claimed => 'On run',
  ItemStatus.pickedUp => 'Picked up',
  ItemStatus.atHome => 'At home',
  ItemStatus.needsStripping => 'Needs stripping',
  ItemStatus.processing => 'Processing',
  ItemStatus.readyForYard => 'Ready for yard',
  ItemStatus.complete => 'Sold / Complete',
  ItemStatus.ignored => 'Ignored',
};
