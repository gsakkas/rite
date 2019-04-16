AppG (fromList [VarG,LitG,ConAppG (Just EmptyG)])
helper 0 (num :: xs') xs
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: xs'))
       xs
helper 0 (num :: accum) xs
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: accum))
       xs
