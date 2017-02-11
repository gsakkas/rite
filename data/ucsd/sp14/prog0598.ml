
let rec digitsOfInt n =
  if n < 0
  then []
  else (let f elem = Printf.printf "Element is %d\n" elem in List.iter f n);;
