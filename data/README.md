Data Sets
=========

`raw.json`
----------
The raw pairs of bad programs and their fixes

`ops.json`
----------
Features based on the presence of an operator in a subexpression

`ops+root.json`
---------------
Like `ops.json` but extended with a summary of the entire program the subexpression came from.

`ops-count+root.json`
---------------
Like `ops+root.json` but counts the number of occurrences of an operator.

`types.json`
------------
Features based on the presence of a type in a subexpression

`types+root.json`
---------------
Like `types.json` but extended with a summary of the entire program the subexpression came from.

`types-count+root.json`
---------------
Like `types+root.json` but counts the number of occurrences of a type.

`ops+type.json`
----------
Features based on the presence of an operator in a subexpression, and the type of the subexpression

`ops+type+context.json`
---------------
Like `ops+type.json` but extended with the features of the subexpression's parent and immediate children.

`ops+type+root.json`
---------------
Like `ops+type.json` but extended with a summary of the entire program the subexpression came from.

`ops+type-aggregate.json`
----------
Features based on the presence of an operator in a subexpression, and the type of the subexpression

`ops+type-aggregate+root.json`
---------------
Like `ops+type.json` but extended with a summary of the entire program the subexpression came from.

