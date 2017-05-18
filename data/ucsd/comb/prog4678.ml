
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | hd::tl -> hd :: (digitsOfInt tl));;
