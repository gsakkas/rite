IteG (BopG EmptyG EmptyG) (ListG (fromList [EmptyG])) (ConAppG (Just EmptyG))
if tl = []
then [(hd , x)]
else (hd , x) :: (argmaker x
                           tl)
