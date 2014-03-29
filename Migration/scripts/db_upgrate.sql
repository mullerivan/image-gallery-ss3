drop table UserDefinedForm;
drop table UserDefinedForm_EmailRecipient;
drop table UserDefinedForm_Live;
drop table UserDefinedForm_versions;
drop table EditableFormField;
drop table EditableOption;
/*
delete from SiteTree where SubsiteID = 1;
*/
delete from SiteTree where ParentID = 15;
select id from SiteTree where parentId not in (select id from SiteTree) and parentId <> 0 ;
delete from SiteTree where id in (452,453,16, 58, 69, 70 , 71 , 72);

CREATE TABLE File_tmp LIKE File; INSERT File_tmp SELECT * FROM File;

delete from File where id in (SELECT GROUP_CONCAT(tmp.ID) FROM File_tmp as tmp GROUP BY tmp.Filename HAVING (COUNT( tmp.Filename ) >1)) or ID in (SELECT GROUP_CONCAT(tmp.ID) FROM File_tmp as tmp GROUP BY tmp.Title HAVING (COUNT( tmp.Title ) >1)) or ID in (SELECT GROUP_CONCAT(tmp.ID) FROM File_tmp as tmp GROUP BY tmp.Name HAVING (COUNT( tmp.Name ) >1)) or ParentId =5984 or ID =5984;
/*
Query OK, 157 rows affected (44.23 sec)
 */
DROP TABLE File_tmp;


delete from SiteTree_Live;
delete from SiteTree_versions;
delete from SiteTree_LinkTracking;
delete from SiteTree_ImageTracking;



delete from Page_Live;
delete from Page_versions;

delete from TruckPage_Live;
delete from TruckPage_versions;

delete from ProductPage_Live;
delete from ProductPage_versions;

delete from PartsPage_Live;
delete from PartsPage_versions;

delete from OBOPage_Live;
delete from OBOPage_versions;


delete from NewsletterPage_Live;
delete from NewsletterPage_versions;   

delete from ImageGalleryPage_Live;
delete from ImageGalleryPage_versions;


delete from ErrorPage_Live;
delete from ErrorPage_versions;

delete from ExcavatorPage_Live;
delete from ExcavatorPage_versions;

delete from GalleryPage_Live;                
delete from GalleryPage_versions;

delete from GhostPage_Live;
delete from GhostPage_versions;


