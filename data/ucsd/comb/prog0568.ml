
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let g (f,x) = let xx = f x in (xx, (xx = (f xx)));;

let h = g f;;
