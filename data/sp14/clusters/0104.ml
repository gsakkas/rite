ListG [AppG [EmptyG,EmptyG,EmptyG]]
[sqsum (mulByDigit i
                   (List.rev (List.map (fun x ->
                                          x * 10)
                                       t)) @ [h * i])]
[List.fold_left f base
                (h :: t)]
