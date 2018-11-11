CaseG (BopG EmptyG EmptyG) [(Nothing,TupleG [EmptyG,EmptyG]),(Nothing,TupleG [EmptyG,EmptyG])]
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
