
let rec reverse s =
  let s2 = String.length s in
  for i = 0 to (s2 - 1) / 2 do
    (let c = s.[i] in s.[i] <- s.[(s2 - i) - 1]; s.[(s2 - i) - 1] <- c)
  done;
  int_of_string s;;

let x = 13;;

let x = "1234" reverse x;;
