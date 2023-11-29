package org.iesvdm.jsp_jdbc_avanzado.dao;


import java.util.List;
import java.util.Optional;
public interface SocioDAO {

    public void create(org.iesvdm.jsp_servlet_jdbc.model.Socio socio);

    public List<org.iesvdm.jsp_servlet_jdbc.model.Socio> getAll();
    public Optional<org.iesvdm.jsp_servlet_jdbc.model.Socio> find(int id);

    public void update(org.iesvdm.jsp_servlet_jdbc.model.Socio socio);

    public void delete(int id);
}