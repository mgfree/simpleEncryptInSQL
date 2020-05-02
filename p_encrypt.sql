/* Encrypt */
create function [dbo].[encrypt] (
    @p_value varchar(max)
    ,@p_mask smallint
)
returns varchar(max)
as
begin
	--declare @mask smallint = 47
	--declare @origValue varchar(1000) = 'abcd 123456 ABCD'
	declare @outValue varchar(max) = ''

	declare @len int = len(@p_value)
	--print @len

	while @len > 0
	begin
		--print replace('outValue: @outValue','@outValue',substring(@value,@len,1))
		--print convert(varbinary, substring(@value,@len,1))
		--print convert(varbinary(1),convert(varbinary, substring(@value,@len,1)) ^ @mask)
		--print convert(varchar(2),convert(varbinary(1),convert(varbinary, substring(@value,@len,1)) ^ @mask),2)
		select
			@outValue = @outValue + convert(varchar(2),convert(varbinary(1),convert(varbinary, substring(@p_value,@len,1)) ^ @p_mask),2)
		--print @outValue
		select @len = @len - 1
	--	print replace('outValue: @outValue','@outValue',@outValue)
	end
	return @outValue
end
go
