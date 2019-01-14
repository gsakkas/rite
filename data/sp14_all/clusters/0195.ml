CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match f b with
| (x , trueOrFalse) -> if trueOrFalse
                       then wwhile (f , x)
                       else x
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
