CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])
match x with
| (c , d) -> match a with
             | (n , listSum) -> match listSum with
                                | [] -> if ((n + c) + d) < 10
                                        then (0 , [n] @ [(n + c) + d])
                                        else (n + 1 , [n + 1] @ [((n + c) + d) mod 10])
                                | h :: t -> if ((n + c) + d) < 10
                                            then (0 , [0] @ ([(c + d) + h] @ t))
                                            else (n + 1 , [((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))
match x with
| (l1e , l2e) -> match a with
                 | (carry , list) -> (let num =
                                        (l1e + l2e) + carry in
                                      (num mod 9 , [7] @ list))
match x with
| (aNum , wholeNum) -> match a with
                       | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                  (mulByDigit aNum
                                                                              wholeNum @ zeros))
match a with
| (w , z) -> match x with
             | (x , y) -> (((x + y) + w) / 10 , (((x + y) + w) mod 10) :: z)
match x with
| (b , c) -> match a with
             | (carry , sum) -> match sum with
                                | [] -> if ((carry + b) + c) < 10
                                        then (0 , [carry] @ [(carry + b) + c])
                                        else (carry + 1 , [carry + 1] @ [((carry + b) + c) mod 10])
                                | h :: t -> if ((b + c) + h) < 10
                                            then (0 , [0] @ ([(b + c) + h] @ t))
                                            else (carry + 1 , [((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))
match x with
| (i , j) -> match a with
             | (m , n) -> if ((i + j) + m) >= 10
                          then (1 , (((i + j) + m) - 10) :: n)
                          else (0 , ((i + j) + m) :: n)
match x with
| (x1 , x2) -> match a with
               | (car , cur) -> match cur with
                                | [] -> if ((car + x1) + x2) > 10
                                        then (car + 1 , [car + 1] @ [(remain car + x1) + x2])
                                        else (0 , [car] @ [(car + x1) + x2])
                                | h :: t -> if ((x1 + x2) + h) < 10
                                            then (0 , [0] @ ([(x1 + x2) + h] @ t))
                                            else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
