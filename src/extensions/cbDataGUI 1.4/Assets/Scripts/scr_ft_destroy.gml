///scr_ft_destroy();
if (surface_exists(pSurface)) surface_free(pSurface);
if (pbuffer_exists(pBuffer)) pbuffer_destroy(pBuffer);
if (surface_exists(fSurface)) surface_free(fSurface);
if (pbuffer_exists(fBuffer)) pbuffer_destroy(fBuffer);
