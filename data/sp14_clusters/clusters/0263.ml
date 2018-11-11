AppG [ListG EmptyG Nothing,AppG [EmptyG,EmptyG]]
List.append [result / 10]
            (List.append [result mod 10]
                         l)
List.append [result / 10]
            (List.append [result mod 10]
                         l)
[(0 , 0)] @ List.combine (List.rev l1)
                         (List.rev l2)
[x] @ clone x (n - 1)
