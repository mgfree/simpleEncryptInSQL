# simpleEncryptInSQL
These SQL scripts can be used to encrypt and decrypt character strings in order to protect a secret string from plain sight. Instead of storing a piece of string (including amounts), the DBA or database developer can encrypt the character string using the encrypt function with a smallint mask to transform the string of which the encrypted string can be stored in the database. Without prior knowledge of the smallint mask used to encrypt the string and the mechanism of the encryption process, viewer of the string will not know the original value (including the DBA who has all previleges in the database.)

Use Cases of the encrypt function include:
1. protecting passwords which are stored inside the database;
2. protecting keys used to call APIs;
3. protecting amounts like salaries, bonuses stored inside the database

Usage:
1. Encrypting the original string
    declare @mask = 47
    declare @origValue = '1//0g2xRE7r1FL--CgYIARAAGBASNwF-L9IryZUl5cRjFPRJh10ZSXrTxZ3Osc5NLAF1aErAzBJ3Aip9oXCQHXkiJlngm0UZ2r3XVQo'
    declare @secret = varchar(max)
    
    select @secret = [dbo].[encrypt](@origValue, @mask)
    go

2. Decrypting the secret string
    declare @mask = 47
    declare @secret = '407E79771C5D1D757A1F4248414365464477677E6C7740165F466E1C656D556E5D6A4E1E696E63611A4C5C601C75577B5D777C751F1E47657D7F69457D4C1A437A75565D661663026958617C6E6D686E6E7D6E6676486C020263691E5D186A7D571D481F00001E'
    declare @origString = varchar(max)

    select @origString = [dbo].[decrypt](@secret, @mask)
    go
