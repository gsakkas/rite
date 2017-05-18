
let rec mulByDigit i l =
  let (cout,res) =
    match l with
    | [] -> (0, [])
    | h::t ->
        let (cin,acc) = mulByDigit i t in
        let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: acc)) in
  if cout > 0 then cout :: res else res;;
