
CREATE TABLE IF NOT EXISTS public.inventario_materiales (
  cliente_id uuid PRIMARY KEY,
  material text NOT NULL,
  categoria text NOT NULL,
  cantidad integer NOT NULL CHECK (cantidad >= 0),
  precio numeric(12,2) NOT NULL CHECK (precio >= 0),
  marca text NOT NULL,
  ubicacion text NOT NULL,
  status text NOT NULL DEFAULT 'online' CHECK (status IN ('online', 'offline'))
);
ALTER TABLE public.inventario_materiales ENABLE ROW LEVEL SECURITY;

GRANT USAGE ON SCHEMA public TO anon;
GRANT INSERT ON public.inventario_materiales TO anon;
DROP POLICY IF EXISTS "Inventario demo insertar" ON public.inventario_materiales;
CREATE POLICY "Inventario demo insertar"
ON public.inventario_materiales FOR INSERT TO anon
WITH CHECK (status = 'online');
