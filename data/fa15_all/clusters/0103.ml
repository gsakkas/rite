IteG (AppG (fromList [EmptyG])) VarG (AppG (fromList [EmptyG]))
if List.mem h seen
then seen
else h :: seen
if List.mem h seen
then seen
else seen @ [h]
