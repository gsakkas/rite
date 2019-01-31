CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match a with
| (a , b) -> if ((fst x + snd x) + a) > 9
             then (1 , (((fst x + snd x) + a) mod 10) :: b)
             else (0 , (((fst x + snd x) + a) mod 10) :: b)
| _ -> if (fst x + snd x) > 9
       then (1 , [(fst x + snd x) mod 10])
       else (0 , [(fst x + snd x) mod 10])
match a with
| (a , b) -> if ((fst x + snd x) + a) > 9
             then (1 , (((fst x + snd x) + a) mod 10) :: b)
             else (0 , (((fst x + snd x) + a) mod 10) :: b)
| _ -> if (fst x + snd x) > 9
       then (1 , [(fst x + snd x) mod 10])
       else (0 , [(fst x + snd x) mod 10])
match a with
| (a , b) -> if ((fst x + snd x) + a) > 9
             then (1 , (((fst x + snd x) + a) mod 10) :: b)
             else (0 , (((fst x + snd x) + a) mod 10) :: b)
| _ -> if (fst x + snd x) > 9
       then (1 , [(fst x + snd x) mod 10])
       else (0 , [(fst x + snd x) mod 10])
match a with
| (a , h :: d :: t) -> if ((fst x + snd x) + a) > 9
                       then (1 , a :: ((((fst x + snd x) + a) mod 10) :: t))
                       else (0 , a :: ((((fst x + snd x) + a) mod 10) :: t))
| _ -> if (fst x + snd x) > 9
       then (1 , [(fst x + snd x) mod 10])
       else (0 , [(fst x + snd x) mod 10])
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
match a with
| (m , n) -> if ((i + j) + m) >= 10
             then (1 , (((i + j) + m) - 10) :: n)
             else (0 , ((i + j) + m) :: n)
match a with
| (m , n) -> if ((i + j) + m) >= 10
             then (1 , (((i + j) + m) - 10) :: n)
             else (0 , ((i + j) + m) :: n)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
