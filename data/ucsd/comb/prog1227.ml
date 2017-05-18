
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (((hd * i) mod 10) + (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;
