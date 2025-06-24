# Make edit.natbienetre.fr relative to natbienetre.fr
s|https://edit.natbienetre.fr||g

# Make canonical links absolute
s|<link rel="canonical" href="/|<link rel="canonical" href="https://natbienetre.fr/|g

# Make EditURI point to edit.natbienetre.fr
#s|<link rel="EditURI" type="application/rsd+xml" title="RSD" href="/|<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://edit.natbienetre.fr/|g

# Remove pingback and editURI link since edit.natbienetre.fr is private
s#<link rel="pingback"( [^>]*)?(/>|[^<]*</link>)##g
s#<link rel="EditURI"( [^>]*)?(/>|[^<]*</link>)##g
