AppG [VarG,LitG,AppG [EmptyG,EmptyG]]
List.fold_left (^) ""
               (List.map f l)
helper 0 (num :: xs') xs
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: xs'))
       xs
helper 0 (num :: accum) xs
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: accum))
       xs
