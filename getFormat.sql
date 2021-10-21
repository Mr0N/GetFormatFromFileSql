CREATE FUNCTION indexCharEnd(@obj nvarchar(max),@separator nvarchar(max))
RETURNS int
AS BEGIN
DECLARE @index int;
DECLARE @charIndex int;
SET @index =0;
WHILE 1=1
BEGIN
	SET @charIndex = @index;
	SET @index = CHARINDEX(@separator,@obj,@index+1);
	IF(@index = 0) RETURN(@charIndex);
END
RETURN(0);
END
GO
CREATE FUNCTION getFormatFromFile(@obj nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
DECLARE @text nvarchar(max);
SET @text = @obj;
RETURN (RIGHT(@text,LEN(@text)-dbo.indexCharEnd(@text,'.')));
END
GO