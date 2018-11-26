CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []
match y with
| [] -> [x]
| h :: t -> h :: (append x t)
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
match l with
| [] -> []
| h :: t -> h :: (listReverse t)
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: t :: s -> head :: (tail :: (t :: s))
match l with
| [] -> []
| h1 :: [] -> [h1]
| h :: t -> h :: (listReverse t)
