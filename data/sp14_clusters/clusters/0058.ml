AppG [AppG [EmptyG,EmptyG],ListG EmptyG Nothing]
bigAdd (mulByDigit (i - 1) l)
       [0]
mulByDigit i
           (m :: t) @ [((h * i) / 10) + ((m * i) mod 10) ; (h * i) mod 10]
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
