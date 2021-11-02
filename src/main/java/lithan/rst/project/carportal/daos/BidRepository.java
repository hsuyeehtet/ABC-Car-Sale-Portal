package lithan.rst.project.carportal.daos;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import lithan.rst.project.carportal.entities.Car;
import lithan.rst.project.carportal.entities.CarBidding;
import lithan.rst.project.carportal.entities.Role;

import java.util.List;
import java.util.Set;


@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long> {

	@Query( "select b from CarBidding b where b.car in :carid" )
	List<CarBidding> findByCarid(@Param("carid") Car car);
}
