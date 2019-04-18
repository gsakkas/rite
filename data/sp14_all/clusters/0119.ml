IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (IteG EmptyG EmptyG EmptyG)
if i = 0
then []
else if i = 1
     then l
     else bigAdd (bigAdd l l)
                 (mulByDigit (i - 2) l)
