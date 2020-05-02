/* Decrypt */
create function [dbo].[decrypt] (
    @p_value varchar(max)
    ,@p_mask smallint
)
returns varchar(max)
as
begin
	--declare @mask smallint = 47
	--declare @origValue varchar(max) = '6B6C6D6E0F191A1B1C1D1E0F4B4C4D4E'
	declare @outValue varchar(max) = ''

	declare @len int = len(@p_value)
	--print @len

	while @len > 0
	begin
		--print replace('outValue: @outValue','@outValue',substring(@value,@len-1,2))
		--print convert(varbinary(1), substring(@value,@len-1,2),2)
		--print char(convert(varbinary(1), substring(@value,@len-1,2),2) ^ @mask)
		--print convert(varchar(2),convert(varbinary(1),convert(varbinary, substring(@value,@len,2),1) ^ @mask),1)
		select
			@outValue = @outValue + char(convert(varbinary(1), substring(@p_value,@len-1,2),2) ^ @p_mask)
		--print @outValue
		select @len = @len - 2
	--	print replace('outValue: @outValue','@outValue',@outValue)
	end
	return @outValue
end
go