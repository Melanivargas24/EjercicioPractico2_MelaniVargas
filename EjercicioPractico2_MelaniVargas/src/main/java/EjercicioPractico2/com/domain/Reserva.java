/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package EjercicioPractico2.com.domain;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
@Entity
@Table(name = "reserva")
public class Reserva implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    private String clienteNombre;
    private int numHuespedes;
    private Date fechaIngreso;
    private Date fechaSalida;
    private int hotelId;
    private String numeroCedula;
    
     public Reserva() {
    }

    public Reserva(String clienteNombre, Date fechaIngreso, Date fechaSalida) {
        this.clienteNombre = clienteNombre;
        this.fechaIngreso = fechaIngreso;
        this.fechaSalida = fechaSalida;
    }

   
    

}

