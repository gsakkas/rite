IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
if i < 1
then []
else (match i with
      | 1 -> l
      | _ -> bigAdd l
                    (mulByDigit (i - 1) l))
