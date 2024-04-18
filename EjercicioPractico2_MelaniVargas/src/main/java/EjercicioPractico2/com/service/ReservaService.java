/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package EjercicioPractico2.com.service;
import EjercicioPractico2.com.domain.Reserva;
import java.util.List;

public interface ReservaService {
    
    public List<Reserva> getReservas();
    
    public Reserva getReserva(Reserva reserva);
    
    public void save(Reserva reserva);
    
    public void delete(Reserva reserva);
}