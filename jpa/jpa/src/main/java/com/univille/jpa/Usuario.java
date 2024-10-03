package com.univille.jpa;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String nome;

    private long espacoDisponivel;

    @ManyToMany
    @JoinTable(
            name = "usuarios_seguindo",
            joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "amigo_id")
    )
    private List<Usuario> amigos;

    @OneToMany(mappedBy = "usuario")
    private List<Playlist> playlists;
}
