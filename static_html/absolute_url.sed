# Change edit.natbienetre.fr to natbienetre.fr
s|https://edit.natbienetre.fr|https://natbienetre.fr|g
s|//edit.natbienetre.fr|//natbienetre.fr|g

# Make sitemap links absolute
s|<loc>/|<loc>https://natbienetre.fr/|g

# Make xml-stylesheet links absolute
s|<?xml-stylesheet type="text/xsl" href="/|<?xml-stylesheet type="text/xsl" href="https://natbienetre.fr/|g
