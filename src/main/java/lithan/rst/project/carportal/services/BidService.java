package lithan.rst.project.carportal.services;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lithan.rst.project.carportal.daos.BidRepository;
import lithan.rst.project.carportal.entities.Car;
import lithan.rst.project.carportal.entities.CarBidding;


@Service
@Transactional
public class BidService {
	@Autowired
	BidRepository repo;

	@Autowired
    private BidRepository bidRepository;

	public CarBidding save(CarBidding carBiding) {		
        return repo.save(carBiding);	
	}

	public List<CarBidding> listAll() {
		return (List<CarBidding>) repo.findAll();
	}

	public List<CarBidding> listBidInfo(Car car) {
		return (List<CarBidding>) repo.findByCarid(car);
	}
	
	public CarBidding get(Long id) {
		return repo.findById(id).get();
	}

	public void delete(Long id) {
		repo.deleteById(id);
	}
	

}
