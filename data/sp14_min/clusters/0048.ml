AppG [ListG [EmptyG]]
append [h] [h]
listReverse [a]
listReverse [n mod 10]
app [5] [n mod 10]
app [3] [8]
List.hd [List.fold_left f base
                        (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)) @ [h * i])]
