package br.tobias.sct.infra.exceptions;

public class NoValueFoundException extends RuntimeException {

    public NoValueFoundException(String message) {
        super(message);
    }
}
