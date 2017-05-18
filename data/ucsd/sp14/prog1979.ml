
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let g b = (b, (b = (f b)));;
