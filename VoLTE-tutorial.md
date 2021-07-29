# VoLTE Tutorial

## 1. Subindo o EPC
### 1.1 Subindo os bancos de dados e DNS

```
docker-compose up -d dns mysql mongo webui 
```

### 1.2 Subindo o HSS e PCRF

```
docker-compose up -d hss pcrf 
```

### 1.3 Subindo o MME SGWC SGWU SMF UPF

```
docker-compose up -d mme 
```

## 2. Subindo o IMS

### 2.1 Subindo o RTP Engine 

```
docker-compose up -d rtpengine 
```
### 2.2 Subindo HSS (Cx) e serviços IMS (I-CSCF, P-CSCF e S-CSCF)
```
docker-compose up -d fhoss icscf scscf pcscf  
```
