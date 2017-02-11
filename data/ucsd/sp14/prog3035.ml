
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with | true  -> [] | false  -> tx :: (clone tx (tn - 1)) in
  clonehelper x abs n;;
