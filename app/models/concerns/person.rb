# The +Person+ class represents a real world person. A +Person+ may be linked to a user or an instructor. The +Person+
# class will describe the basic information of a person.
#
# Attributes are stored as follows:
#
# 	* +:name+ stores the name of the person.
# 	* +:dob+ gives the date of birth of the person.
# 	* +:sex+ is the sex of the person (Male, Female, or Neither).
# 	* +:gender+ gives the gender identy of the person.
# 	* +:pronoun+ is the word the person wants to be refer to by in third person (He, She, It, Their, etc.).
# 	* +:title+ is the prefix of the person when refered to in a formal manor (Mr., Mrs, Dr., etc).
# 	* +:suffix+ is a set of qualifications or genealogical identifers of a person (PHD, MD, etc).
#
class Person < ActiveRecord::Base

end