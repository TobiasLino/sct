package br.tobias.sct.domain.user;

import lombok.Getter;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("REQUESTER")
@Getter
public class Requester extends SCTUser {

    @Column(name = "cpf")
    private String identification;

    public Requester(String name, String email, String password, String identification) {
        super(name, email, password, ProviderType.LOCAL, SCTUserType.REQUESTER);
        this.identification = identification;
    }

    public Requester(String name, String email, String identification) {
        super(name, email, ProviderType.GOOGLE, SCTUserType.REQUESTER);
        this.identification = identification;
    }

    public Requester() {
        super();
    }
}
