
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile func else value;;
