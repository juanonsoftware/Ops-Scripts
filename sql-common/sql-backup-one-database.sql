-- NOTE
-- Must update dbName & Folder

declare @dbName nvarchar(150);
declare @folder nvarchar(100);

set @dbName = 'DB NAME';
set @folder = 'Path to folder ending with \';

declare @path nvarchar(255);
declare @dateInfo nvarchar(50);

-- https://msdn.microsoft.com/en-us/library/ms186862.aspx
set @dateInfo = REPLACE(convert(nvarchar, getdate(), 20), ':', '');
set @dateInfo = REPLACE(@dateInfo, '-', '');
set @dateInfo = REPLACE(@dateInfo, ' ', '-');
set @path = @folder + @dbName + '-' + @dateInfo + '.bak';

print 'Backup path: ' + @path;

-- https://msdn.microsoft.com/en-us/library/ms187510.aspx
backup database @dbName
to disk = @path
WITH 
	DIFFERENTIAL,
	COMPRESSION;

