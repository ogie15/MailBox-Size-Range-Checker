# MailBoxSize
checks mailbox size 

For this to work need to connect to exchange online via PowerShell [visit](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell?view=exchange-ps)

## Script instructions are below

There will be a prompt to enter the size of mailbox you want to check *kindly enter numbers* *example 12*

Next prompt will be to enter a condtion for the range 

Enter **<** to check for mailboxes less than that size

Enter **>** to check for mailboxes greater than that size

Next Prompt will be to enter the size (**KB,MB,GB**) as the initial prompt for a value was quite vague

Kindly Note that the script will isolate the size checking to the size value specified 

If *KB* is entered it will only check mailboxes within *KB* ranges

That is for mailbox that are 1024KB which is equal to 1MB will not be checked or included in the output

For does mailboxes you will need to enter *MB* when on third prompt


