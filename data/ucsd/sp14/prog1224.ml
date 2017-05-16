
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) / 10) != 0
        then ((hd * i) mod 10) :: (((hd * i) / 10) + (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;
