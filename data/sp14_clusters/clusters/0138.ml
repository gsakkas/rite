CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing)]
match l with
| [] -> []
| b :: [] -> [b]
match l with
| [] -> []
| b :: [] -> [b]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
