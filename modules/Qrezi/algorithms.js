
function descendants(c)
{
   var ds = []
   ds.push(c)
   for (var n in c.children)
      ds.push.apply( ds, descendants(c.children[n]) )
   return ds
}


function ancestors(p)
{
   var ps = []
   while ( p = p.parent ) ps.push(p)
   return ps
}


function any_of( xs, p )
{
   for ( var n = 0; n < xs.length; ++n )
      if (p(xs[n])) return true
   return false
}
