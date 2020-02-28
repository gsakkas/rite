IteG (AppG [EmptyG,EmptyG]) VarG (AppG [EmptyG,EmptyG])
if List.mem h seen
then seen
else h :: seen
EMPTY
if List.mem h seen
then seen
else seen @ [h]
if List.mem h seen
then h :: seen
else seen
