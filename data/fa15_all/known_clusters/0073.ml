CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
match a with
| (0 , []) -> (b / 10 , [b mod 10])
| (y , h :: t) -> (b / 10 , (b mod 10) :: ((h + y) :: t))
match a with
| (0 , []) -> (b / 10 , [b mod 10])
| (y , h :: t) -> (b / 10 , (b mod 10) :: ((h + y) :: t))
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
match a2 with
| [] -> (0 :: a1 , (sum / 10) :: ((sum mod 10) :: a2))
| h :: t -> ((sum / 10) :: a1 , (sum mod 10) :: a2)
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
