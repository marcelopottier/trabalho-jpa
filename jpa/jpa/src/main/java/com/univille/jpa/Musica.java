package com.univille.jpa;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class Musica {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String titulo;

    private String artista;

    private String genero;

    private boolean disponivelOffline;

    @OneToOne(mappedBy = "musica")
    private Letra letra;
}
