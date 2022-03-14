ALTER TABLE `collector` ADD INDEX `collector_idx_ordernumber_collectingevent` (`OrderNumber`,`CollectingEventID`);
ALTER TABLE `determination` ADD INDEX `determination_idx_iscurrent_collectionobjec` (`IsCurrent`,`CollectionObjectID`);
ALTER TABLE `taxon` ADD INDEX `taxon_idx_rankid_taxonid` (`RankID`,`TaxonID`);
ALTER TABLE `taxontreedefitem` ADD INDEX `taxontreedefitem_idx_rankid` (`RankID`);
